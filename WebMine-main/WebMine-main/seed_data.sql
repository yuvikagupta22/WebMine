-- Starter catalogue data: links the 7 scraped ASINs to a category and a short SKU name.
INSERT INTO bsc.categories (name) VALUES ('Trimmers') ON CONFLICT (name) DO NOTHING;

INSERT INTO bsc.productmaster (ipcode, whsku, categoryid)
SELECT v.ipcode, v.whsku, c.id
FROM (VALUES
  ('BSC-001', 'Power Play NXT Trimmer'),
  ('BSC-002', 'Beard Trimmer 120 Min'),
  ('BSC-003', 'Baller Body Groomer'),
  ('BSC-004', '11-in-1 Trimmer'),
  ('BSC-005', 'Premium Multi Grooming Trimmer'),
  ('BSC-006', '11-in-1 Grooming Kit'),
  ('BSC-007', 'Head Shaver Pro')
) AS v(ipcode, whsku)
CROSS JOIN bsc.categories c WHERE c.name = 'Trimmers'
ON CONFLICT (ipcode) DO UPDATE SET whsku = EXCLUDED.whsku, categoryid = EXCLUDED.categoryid;

INSERT INTO amazon.productmaster (platformcode, ipcode) VALUES
  ('B0D2HFN2N1', 'BSC-001'),
  ('B098P8NRRW', 'BSC-002'),
  ('B0D91S9NF1', 'BSC-003'),
  ('B0D96CPM1B', 'BSC-004'),
  ('B0CKLP826Z', 'BSC-005'),
  ('B0CHSCR7B7', 'BSC-006'),
  ('B0CGNHGXXH', 'BSC-007')
ON CONFLICT (platformcode) DO UPDATE SET ipcode = EXCLUDED.ipcode;

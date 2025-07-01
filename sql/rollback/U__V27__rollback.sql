DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'bairro') THEN
    ALTER TABLE bairro DROP CONSTRAINT IF EXISTS bairro_cidade_id_fkey;
    DROP TABLE bairro;
  END IF;
END $$;

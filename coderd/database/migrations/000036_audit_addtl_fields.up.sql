ALTER TABLE audit_logs ADD COLUMN additional_fields jsonb NOT NULL DEFAULT '{}'::jsonb;
ALTER TABLE audit_logs ALTER COLUMN additional_fields DROP DEFAULT;
ALTER TABLE audit_logs ADD COLUMN request_id uuid NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000'::uuid;
ALTER TABLE audit_logs ALTER COLUMN request_id DROP DEFAULT;

UPDATE template_versions SET created_by = '00000000-0000-0000-0000-000000000000'::uuid WHERE created_by IS NULL;
ALTER TABLE template_versions ALTER COLUMN created_by SET NOT NULL;

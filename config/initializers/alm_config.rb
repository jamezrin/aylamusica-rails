def alm_config_path
  Rails.root.join('config/aylamusica.yml')
end

def load_alm_config
  YAML.load_file(alm_config_path)
end

def save_alm_config
  File.write(alm_config_path, ALM_CONFIG.to_yaml)
end


ALM_CONFIG = load_alm_config

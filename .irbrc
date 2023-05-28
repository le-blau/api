# コンソール起動時にHirbを有効化
if defined? Rails::Console
  Hirb.enable if defined? Hirb
end
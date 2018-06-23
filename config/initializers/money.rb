MoneyRails.configure do |config|
  config.default_currency = :eur  # or :gbp, :usd, etc.
  config.default_format = {
    thousands_separator: ' ',
    symbol_first: false,
    symbol: '€',
    sign_before_symbol: false
  }
end

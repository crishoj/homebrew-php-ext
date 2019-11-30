require File.expand_path("../lib/php_extension_formula", __dir__)

class PhpImap < PhpExtensionFormula
  extension_dsl "IMAP Extension"

  conflicts_with "php-recode", :because => "because both share the same internal symbols"

  depends_on "krb5"
  depends_on "imap-uw"
  depends_on "openssl@1.1"

  ENV['PHP_OPENSSL'] = 'yes'

  configure_arg %W[
    --with-imap=#{Formula["imap-uw"].opt_prefix}
    --with-imap-ssl=#{Formula["openssl@1.1"].opt_prefix}
    --with-kerberos=#{Formula["krb5"].opt_prefix}
  ]
end

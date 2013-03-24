require "middleman-core"
require "middleman-listpages/version"

::Middleman::Extensions.register(:listpages) do
  require "middleman-listpages/extension"
  ::Middleman::ListPages
end
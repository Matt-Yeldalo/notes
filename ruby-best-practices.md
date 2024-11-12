# Ruby Best Practices

## Good API

wrapper that delegating to appropriate constructor

```ruby
def Table(*args, &block)
  case args[0]
  when Array
    opts = args[1] || {}
    Data::Table.new({ column_names: args[0] }.merge(opts), &block)
  when /\.csv$/i
    Data::Table.load(*args, &block)
  when Hash
    if file = args[0].delete(:file)
      Data::Table.load(file, args[0], &block)
    elsif string = args[0].delete(:string)
      Data::Table.parse(string, args[0], &block)
    else
      Data::Table.new(args[0], &block)
    end
  else
    Data::Table.new(data: [], column_names: args, &block)
  end
end
```

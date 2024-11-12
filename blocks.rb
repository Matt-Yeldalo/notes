class Meth
  def add(*args, &block)
    first_argument = args.first
    case first_argument
    when Array
      harray = Harray.new(*args)
      opts = harray.second
      puts "The options: #{opts}"
      fist_argument.sum(opts, &block)
    when Hash
      puts 'hash'
    end
  end
end

class Client
  def initialize(ip = '127.0.0.1', port = 3000)
    @ip = ip
    @port = port
  end

  def message(msg)
    connection do |socket|
      cocket.puts(msg)
      socket.gets
    end
  end

  def receive_message
    connection { |socket| socket.gets }
  end

  private

  def connection
    socket = TCPSocket.new(@ip, @port)
    yield(socket)
  ensure
    socket.close
  end
end

class Harray < Array
  def second
    [1]
  end
end

meth = Meth.new

result = meth.add([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], deez: nuts, cum: dum)
puts result

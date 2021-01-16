# The first thing we need to do is to establish a connection with RabbitMQ server
{:ok, connection} = AMQP.Connection.open("amqps://cbopxdcr:bEXpHfdqo-xvSunhSvKoWRcntEJVKrlz@orangutan.rmq.cloudamqp.com/cbopxdcr")
{:ok, channel} = AMQP.Channel.open(connection)

# Next, before sending we need to make sure the recipient queue exists.
# If we send a message to non-existing location, RabbitMQ will just trash the message.
# Let's create a queue to which the message will be delivered
AMQP.Queue.declare(channel, "my-queue")


# At that point we're ready to send a message.
# Our first message will just contain a string Hello World! and we want to send it to our my-queue queue.
# In RabbitMQ a message can never be sent directly to the queue, it always needs to go through an exchange.
# We'll be using te default exchange, identified by an empty string
# This exchange is special ‒ it allows us to specify exactly to which queue the message should go.
# The queue name needs to be specified in the routing_key parameter:
AMQP.Basic.publish(channel, "", "my-queue", "Hello World!")
IO.puts " [x] Sent 'Hello World!'"

# Before exiting the program we need to make sure the network buffers were flushed and our message
# was actually delivered to RabbitMQ. We can do it by gently closing the connection.
AMQP.Connection.close(connection)

# RabbitMQ Single Queue Example - Elixir

**Description**

The most common use case for RabbitMQ is a single producer, single consumer.

That's what this project is.

The server we'll be using for this example is a free tier from CloudAMPQ.

First, put the receiver on hold, so it connects to the RabbitMQ server and wait for messages related to the queue it's subscribed.

Then, send the message with the producer client.

After that, you will see how the subscriber receives the message and shows it into your console.

So, the steps are:

`git clone `

`mix deps.get`

`mix deps.compile`

`mix run receive.exs`

`mix run send.exs`

And that's how a receiver gets info via messages.

More detailed info inside each `.exs` file.

class SayHelloJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "SayHelloJob is running! Next line will raise an exception, which should end up in Honeybadger."

    raise "Exception from a job!"

    puts "Hello World from a Job!"
  end
end

class RpgController < ApplicationController
  def index

    if !session[:total_gold]
      session[:total_gold] = 0
    end

    if !session[:messages]
      session[:messages] = []
    end

    @message = session[:messages]

    puts "\n\n\n", @message.inspect, "\n\n\n"
  end

  def farm
    @time = Time.now.to_formatted_s(:long)
    session[:gold] = (10..20).to_a.sample

    puts "\n\n\n", session[:gold], "\n\n\n"

    session[:total_gold] += session[:gold]

    session[:messages] << "Earned #{session[:gold]} golds from the farm! #{@time}"
    puts "\n\n\n", @time, "\n\n\n"

    redirect_to action: "index"
  end

  def cave
    @time = Time.now.to_formatted_s(:long)
    session[:gold] = (5..10).to_a.sample

    puts "\n\n\n", session[:gold], "\n\n\n"

    session[:total_gold] += session[:gold]

    session[:messages] << "Earned #{session[:gold]} golds from the cave! #{@time}"

    redirect_to action: "index"
  end

  def casino
    @time = Time.now.to_formatted_s(:long)
    session[:gold] = (-50..50).to_a.sample

    puts "\n\n\n", session[:gold], "\n\n\n"

    session[:total_gold] += session[:gold]

    if session[:gold] < 0
      session[:messages] << "Entered a casino and lost #{session[:gold]} golds... Ouch.. #{@time}"
    else
      session[:messages] << "Earned #{session[:gold]} golds from the casino! #{@time}"
    end

    redirect_to action: "index"
  end

  def house
    @time = Time.now.to_formatted_s(:long)
    session[:gold] = (2..5).to_a.sample

    puts "\n\n\n", session[:gold], "\n\n\n"

    session[:total_gold] += session[:gold]

    session[:messages] << "Earned #{session[:gold]} golds from the house! #{@time}"

    redirect_to action: "index"
  end


end

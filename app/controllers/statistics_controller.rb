class StatisticsController < ApplicationController
  def subscriptions_graph
    days = (params[:days] || 30).to_i
    render :json => {
      :type => 'AreaChart',
      :cols => [['string', 'Date'], ['number', 'subscriptions'], ['number', 'purchases']],
      :rows => (1..days).to_a.inject([]) do |memo, i|
        date = i.days.ago.to_date
        t0, t1 = date.beginning_of_day, date.end_of_day
        subscriptions = 1
        purchases = 2
        memo << [date, subscriptions, purchases]
        memo
      end.reverse,
      :options => {
        :chartArea => { :width => '90%', :height => '75%' },
        :hAxis => { :showTextEvery => 30 },
        :legend => 'bottom',
      }
    }
  end
  def subscriptions_graph_2
    render :json => {
      :size => '150x150',
      :type => 'qr',
      :data => '1',
      :url => 'https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=1'
    }
  end
end
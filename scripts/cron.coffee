cronJob = require('cron').CronJob


finishing_work_msgs  = [
   "@here 早く仕事終えて、私と遊ぼうよ",
   "@here 定時だぞーーーー",
   "@here 一緒に帰ろうよお",
]

go_home_msgs = [
  "@here ふあ、そろそろ寝たいなあ。。。",
  "@here あんまり無理すると明日に響くよ",
  "@here 帰るんだーーーー",
  "@here 先にお家で待ってるんだからね",
  "@here あんまり遅いと、夕ご飯、勝丸にしちゃうぞ！"
]


module.exports = (robot) ->

  send = (channel, msg) ->
    robot.send {room: channel}, msg

  new cronJob('0 30 09 * * 1-4', () ->
    send '#general', "@here おはよっ！今日も1日楽しもうね！"
  ).start()

  new cronJob('0 00 13 * * 1-5', () ->
    send '#general', "@here そろそろご飯にしない？"
  ).start()

  new cronJob('0 30 18 * * 1-4', () ->
    send '#general', "@here 早く仕事終えて、私と遊ぼうよ"
  ).start()

  new cronJob('0 00 22 * * 1-4', () ->
    send '#general', "@here ふあ、そろそろ寝たいなあ。。。"
  ).start()

  new cronJob('0 30 09 * * 5', () ->
    send '#general', "@here 今日が終われば、明日は休みだよ！！"
  ).start()

  new cronJob('0 30 18 * * 5', () ->
    send '#general', "@here ねえ、早く仕事が終わったら、金曜日だしどこかに飲みに行こっか？"
  ).start()

  new cronJob('0 00 22 * * 5', () ->
    send '#general', "@here まだ、かかりそう...??"
  ).start()

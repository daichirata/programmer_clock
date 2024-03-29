$ ->
  do ->
    alignDigit = (num)->
      if num < 10 then "0" + num else num

    now = ->
      date = new Date
      hour = alignDigit date.getHours()
      min  = alignDigit date.getMinutes()
      sec  = alignDigit date.getSeconds()

      # for debug
      # hour = "01"

      {
        time: hour + ":" + min + ":" + sec
        word: Words[hour]
        background: "/plugin/lokka-static/views/programmer_clock/images/#{hour}.jpg"
      }

    Words =
      "00": "明日が締切と言われたら、明日の9時までに終わればいいんだよ。"
      "01": "努力すればするほど深みにはまる。2時から本気出す"
      "02": "明けない夜は無い、だが出口の無いトンネルはある。"
      "03": "「夜明けよ来ないでくれ！」by.納品日3:00に作業中の漏れ。"
      "04": "幸せは布団の中にある。5時まで寝る。"
      "05": "明日休めるのなら死んでもいい。"
      "06": "バグは夜更け過ぎに仕様に変わるだろう。"
      "07": "自律神経のひとつやふたつ、くれてやるつもりで取り組め。"
      "08": "「無理です！」は言ったもん勝ち。9時までになんて無理です！"
      "09": "徹夜明けの朝はコードを書く気分ではない。10時から本気出す。"
      "10": "11時からクライアントと定例ミーティング。作業が途切れるのでしばらく休憩。"
      "11": "徹夜(デスマ)で眠気が限界。12時までトイレで寝る。"
      "12": "明日が締切と言われたら、明日の9時までに終わればいいんだよ。"
      "13": "努力すればするほど深みにはまる。14時から本気出す。"
      "14": "不具合はとりあえず、タイミングの問題って事にしておいて15時まで様子をみる。"
      "15": "1週は7日間、1日は24時間ある。まだ慌てるような時間じゃない。16時から本気出す。"
      "16": "今日も夜は長い。ここで飛ばしすぎずに17時から本気出す。"
      "17": "１日中モニターを見ているので目が痛い。休憩し目を休めて18時から本気出す。"
      "18": "今日は家に帰れそうもない。夕飯買いに行って19時から本気出す。"
      "19": "気がつけば、上司が帰っていた。腹がたったので20時から本気出す。"
      "20": "今日中とは明日の朝までという意味である。21時から本気出す"
      "21": "自分はやれば出来るんだ。だから22時から本気出す。"
      "22": "1匹のバグを見つけたら30匹のバグがいた。気が滅入ったので23時まで休む"
      "23": "1日ってなんで２４時間しかないんですか？"

    counter = (background, clock, word) ->
      current = now()

      background.attr { src: current.background, alt: current.word }
      clock.text(current.time)
      word.text(current.word)

      setTimeout ->
        counter background, clock, word
      , 1000

    counter $('#bg'), $('#clock'), $('#word')

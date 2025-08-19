# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# カテゴリの作成
categories = [
  {
    name: "休学・留年体験談",
    description: "なぜ休学・留年したか、どう復帰したかなど、リアルな体験談を共有しましょう。",
    color: "#dc3545"
  },
  {
    name: "資格勉強法シェア",
    description: "TOEIC、簿記、ITパスポートなどの勉強法・教材共有。独学者に役立つ情報を集めましょう。",
    color: "#28a745"
  },
  {
    name: "ゼミ・研究室の実態掲示板",
    description: "雰囲気、忙しさ、教授の人柄など、学内で聞きにくい情報を共有しましょう。",
    color: "#007bff"
  },
  {
    name: "履修相談掲示板",
    description: "オススメ科目、テストの傾向など、授業選びに役立つ情報を共有しましょう。",
    color: "#ffc107"
  },
  {
    name: "就職活動・インターン経験談",
    description: "どこを受けたか、受かったか、落ちた理由など、正直な体験談を共有しましょう。",
    color: "#6f42c1"
  },
  {
    name: "大学編入・大学院進学体験談",
    description: "編入試験、院試の過去問や対策法など、希少な情報を共有しましょう。",
    color: "#fd7e14"
  },
  {
    name: "学習障害・発達特性×学び",
    description: "困りごとや支援制度の情報共有。支援者・当事者が情報交換できる場所です。",
    color: "#e83e8c"
  },
  {
    name: "通信制大学・夜間大学の体験談",
    description: "働きながら学ぶ人のリアルな声。実際の勉強法や継続のコツなどを共有しましょう。",
    color: "#20c997"
  },
  {
    name: "語学学習法掲示板",
    description: "英語、韓国語、中国語など、語学学習のコツや教材を共有しましょう。",
    color: "#17a2b8"
  },
  {
    name: "試験前の応援・雑談板",
    description: "不安や孤独感を減らす雑談・相談場所。メンタルサポートとしても活用してください。",
    color: "#6c757d"
  }
]

categories.each do |category_data|
  Category.find_or_create_by!(name: category_data[:name]) do |category|
    category.description = category_data[:description]
    category.color = category_data[:color]
  end
end

# サンプル投稿の作成
if Post.count == 0
  sample_posts = [
    {
      category_name: "休学・留年体験談",
      title: "1年間休学して海外留学した体験談",
      content: "大学2年生の時に1年間休学して海外留学をしました。最初は不安でしたが、今振り返ると人生で最も貴重な経験だったと思います。\n\n休学を決めた理由、準備期間、留学中の生活、復学後の変化など、詳しく書いていきます。\n\n特に印象的だったのは、異文化での生活を通じて自分の価値観が大きく変わったことです。日本にいた時は気づかなかった日本の良さも、海外に行って初めて実感できました。\n\n復学後は、より積極的に授業に参加するようになり、将来の目標も明確になりました。休学を迷っている人には、ぜひ挑戦することをお勧めします。",
      author_name: "留学経験者",
      anonymous: false
    },
    {
      category_name: "資格勉強法シェア",
      title: "TOEIC800点取得の勉強法",
      content: "3ヶ月でTOEICスコアを600点から800点に上げることができました。以下が私の勉強法です。\n\n【使用教材】\n- 公式問題集\n- 単語帳（金のフレーズ）\n- リスニングアプリ\n\n【勉強スケジュール】\n- 朝：30分リスニング\n- 昼：1時間リーディング\n- 夜：30分単語学習\n\n【ポイント】\n1. 毎日継続することが重要\n2. 間違えた問題は必ず復習\n3. 本番と同じ時間配分で練習\n\n特に効果的だったのは、毎日少しずつでも継続することです。まとめて勉強するよりも、毎日コツコツと続ける方が記憶に定着しやすかったです。",
      author_name: "英語学習者",
      anonymous: false
    },
    {
      category_name: "ゼミ・研究室の実態掲示板",
      title: "〇〇大学△△研究室の実態",
      content: "現在〇〇大学の△△研究室に所属しています。\n\n【研究室の雰囲気】\n- 教授はとても親切で、質問しやすい環境\n- 先輩後輩の関係も良好\n- 週1回のゼミは緊張するが、勉強になる\n\n【忙しさ】\n- 3年生：週2回のゼミ参加\n- 4年生：卒論執筆で忙しい\n- 夏休みは研究合宿あり\n\n【教授の人柄】\n- 厳しいが公平\n- 学生の意見をよく聞いてくれる\n- 研究熱心で情熱的\n\n全体的に満足していますが、研究が好きでない人には少し厳しいかもしれません。",
      author_name: "",
      anonymous: true
    }
  ]

  sample_posts.each do |post_data|
    category = Category.find_by(name: post_data[:category_name])
    if category
      post = category.posts.create!(
        title: post_data[:title],
        content: post_data[:content],
        author_name: post_data[:author_name],
        anonymous: post_data[:anonymous]
      )

      # サンプルコメントも追加
      if post_data[:title].include?("TOEIC")
        post.comments.create!(
          content: "とても参考になりました！私も同じ教材を使ってみようと思います。",
          author_name: "TOEIC受験予定者",
          anonymous: false
        )
      elsif post_data[:title].include?("研究室")
        post.comments.create!(
          content: "詳しい情報をありがとうございます。参考になります。",
          author_name: "",
          anonymous: true
        )
      end
    end
  end
end

puts "シードデータの作成が完了しました！"
puts "作成されたカテゴリ数: #{Category.count}"
puts "作成された投稿数: #{Post.count}"
puts "作成されたコメント数: #{Comment.count}"

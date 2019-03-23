#encoding: utf-8
# 改札機を表すクラス
class Gate
  # 以下の前提条件のもと作成する<br>
  # ・1区間なら150円、2区間なら190円<br>
  # ・駅は梅田、十三、三国の3駅のみ
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  # Gateオブジェクトの作成
  # ==== 引数
  # * +name+ - 駅名
  def initialize(name)
    @name = name
  end

  # 改札機を通って駅に入場する
  # ==== 引数
  # * +ticket+ - きっぷ
  def enter(ticket)
    ticket.stamp(@name)
  end

  # 改札機を通って駅から出場する
  # ==== 引数
  # * +ticket+ - 切符
  # ==== 戻り値
  # * +boolean+ - 運賃が足りていれば+true+、不足していれば+false+
  def exit(ticket)
    fare = calc_fare(ticket)
    # ↓ if fare <= ticket.fare〜と同じ意味<br />
    # 左辺:このクラス内で定義された最低料金<br />
    # 右辺:入場したときの料金(Ticketクラスのfare属性)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    # indexメソッドは、引数の値が存在する要素番号を返すメソッド
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end

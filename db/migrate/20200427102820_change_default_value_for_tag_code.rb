class ChangeDefaultValueForTagCode < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tags, :code, from: nil, to: SecureRandom.hex(3).downcase
  end
end

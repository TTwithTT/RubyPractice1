require "csv"

FirstMessage = "1(新規でメモを作成) 2(既存のメモを編集する)"
NewMemoAnnouncement1 = "拡張子を除いたファイル名を指定してください"
NewMemoAnnouncement2 = "メモしたい内容を記入してください\n完了したらCtrl+Dを押します"
EditMemoAnnouncement1 = "編集したい既存のファイル名を、拡張子は付けずに指定してください"
EditMemoAnnouncement2 = "上書きする内容を記入してください\n完了したらCtrl+Dを押します"
ErrorMessage1 = "半角数字の 1 または 2 で操作を指定ください"
ErrorMessage2 = ".は使用できません"
ErrorMessage3 = "ファイルが見つかりませんでした。ファイル名を確認してください ↓\n"
ErrorMessage4 = "やり直してみてください"


puts FirstMessage

InputInt = gets.to_i
if InputInt == 1 then
	puts NewMemoAnnouncement1
	InputStringTitle1 = gets

	puts NewMemoAnnouncement2
	InputStringContent1 = STDIN.read
	begin
		CsvTitle1 = InputStringTitle1.chomp!+'.csv'
		CSV.open(CsvTitle1, 'w') do |csv|
		csv << [InputStringContent1]
		end
	rescue
		puts ErrorMessage4
	end
elsif InputInt == 2
	puts EditMemoAnnouncement1
	InputStringTitle2 = gets

	puts EditMemoAnnouncement2
	InputStringContent2 = STDIN.read

	CsvTitle2 = InputStringTitle2.chomp!+'.csv'
	#既存のファイルを見つけられない場合はcsvのエラーで引っかけたい
	begin
		CSV.open(CsvTitle2, 'w') do |csv|
		csv << [InputStringContent2]
		end
	rescue
		puts ErrorMessage3 + InputStringTitle2
	end
else
	puts ErrorMessage1
end


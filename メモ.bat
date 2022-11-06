@rem　本日の日付を取得しTODAYに代入
set TODAY=%date:~0,4%%date:~5,2%%date:~8,2%
@rem TODAYに1を引き昨日の日付を取得しYESに代入
set /a YES=%TODAY%-1
@rem TODAYに1を足し翌日の日付を取得しTOMに代入
set /a TOM=%TODAY%+1
@rem TOMに2を足し3日後の日付を取得し、MONDAYに代入（金曜日に実行した場合に使用）
set /a MONDAY=%TOM%+2


@rem 西暦の下二桁を取得
set /a YYYY=%DATE:~0,4% * 1

@rem 月を取得
set /a MM=%DATE:~5,2% * 1

@rem 日を取得
set /a DD=%DATE:~8,2% * 1


@rem 1月か2月なら年数を引いて月に12を足す ("ツェラーの公式"により 1月と2月は、前年のそれぞれ13月、14月として扱うため)
if %MM% LEQ 2 (
 set /a YYYY=%YYYY% - 1
 set /a MM=%MM% + 12
 )

@rem よくわからん計算式で本日の曜日が取得できます。
@rem 曜日が1が日曜～7が土曜という結果が導き出されます。
set /a YOUBI=(%YYYY% + %YYYY% / 4 - %YYYY% / 100 + %YYYY% / 400 + (13 * %MM% + 8) / 5 + %DD%) %% 7
set /a YOUBI=%YOUBI%+1


@rem　どっちにしろ本日日付の夕会メモは作る
@rem 実行した日が金曜（6）だった場合、3日後（月曜日）の日付で朝会メモを作成する
if %YOUBI% EQU 7 (
copy C:\Users\81906\Desktop\夕会\%YES%_夕会.txt C:\Users\81906\Desktop\夕会\%TODAY%_夕会.txt
copy C:\Users\81906\Desktop\朝会\%TODAY%_朝会.txt C:\Users\81906\Desktop\朝会\%MONDAY%_朝会.txt
)

@rem 実行した日が月曜から木曜の場合は明日の日付で朝会メモを作成する。
if %YOUBI% neq 7 (
copy C:\Users\81906\Desktop\夕会\%YES%_夕会.txt C:\Users\81906\Desktop\夕会\%TODAY%_夕会.txt
copy C:\Users\81906\Desktop\朝会\%TODAY%_朝会.txt C:\Users\81906\Desktop\朝会\%TOM%_朝会_%.txt
)


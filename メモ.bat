@rem�@�{���̓��t���擾��TODAY�ɑ��
set TODAY=%date:~0,4%%date:~5,2%%date:~8,2%
@rem TODAY��1����������̓��t���擾��YES�ɑ��
set /a YES=%TODAY%-1
@rem TODAY��1�𑫂������̓��t���擾��TOM�ɑ��
set /a TOM=%TODAY%+1
@rem TOM��2�𑫂�3����̓��t���擾���AMONDAY�ɑ���i���j���Ɏ��s�����ꍇ�Ɏg�p�j
set /a MONDAY=%TOM%+2


@rem ����̉��񌅂��擾
set /a YYYY=%DATE:~0,4% * 1

@rem �����擾
set /a MM=%DATE:~5,2% * 1

@rem �����擾
set /a DD=%DATE:~8,2% * 1


@rem 1����2���Ȃ�N���������Č���12�𑫂� ("�c�F���[�̌���"�ɂ�� 1����2���́A�O�N�̂��ꂼ��13���A14���Ƃ��Ĉ�������)
if %MM% LEQ 2 (
 set /a YYYY=%YYYY% - 1
 set /a MM=%MM% + 12
 )

@rem �悭�킩���v�Z���Ŗ{���̗j�����擾�ł��܂��B
@rem �j����1�����j�`7���y�j�Ƃ������ʂ������o����܂��B
set /a YOUBI=(%YYYY% + %YYYY% / 4 - %YYYY% / 100 + %YYYY% / 400 + (13 * %MM% + 8) / 5 + %DD%) %% 7
set /a YOUBI=%YOUBI%+1


@rem�@�ǂ����ɂ���{�����t�̗[����͍��
@rem ���s�����������j�i6�j�������ꍇ�A3����i���j���j�̓��t�Œ�������쐬����
if %YOUBI% EQU 7 (
copy C:\Users\81906\Desktop\�[��\%YES%_�[��.txt C:\Users\81906\Desktop\�[��\%TODAY%_�[��.txt
copy C:\Users\81906\Desktop\����\%TODAY%_����.txt C:\Users\81906\Desktop\����\%MONDAY%_����.txt
)

@rem ���s�����������j����ؗj�̏ꍇ�͖����̓��t�Œ�������쐬����B
if %YOUBI% neq 7 (
copy C:\Users\81906\Desktop\�[��\%YES%_�[��.txt C:\Users\81906\Desktop\�[��\%TODAY%_�[��.txt
copy C:\Users\81906\Desktop\����\%TODAY%_����.txt C:\Users\81906\Desktop\����\%TOM%_����_%.txt
)


unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,SynCrypto, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  aes: TAESCBC;
  iv,key: TAESBlock;
  arr : TAESByteArray;
  KeyStr,InitStr:AnsiString;
  Key1,Key2:ANSIstring;
  ii:integer;
  R:string;
begin
  KeyStr  :=  '0A251F157AF189C6BD9495897279DFE9';
  InitStr :=  '0EDF25C93A28D7B5FF5E45DA42F8A1B8';
  arr := HexStrToArray( String(InitStr) );
  for ii:=0 to High(arr) do  begin
      iv[ii] := arr[ii];
  end;
  arr := HexStrToArray(  String(KeyStr) );
  for ii:=0 to High(arr) do  begin
      key[ii] := arr[ii];
  end;
  aes := TAESCBC.Create(key, 128, iv);
  R :=  String(aes.DecryptPKCS7(Base64ToBin(Key2)));
  aes.Free;

  showmessage(R);


end;

end.

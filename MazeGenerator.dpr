program MazeGenerator;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tform1, form1);
  Application.Run;
end.

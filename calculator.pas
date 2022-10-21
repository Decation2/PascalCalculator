uses System;
uses FormsABC;

const
  Sum = '+';
  Difference = '-';
  Multiplication = '*';
  Division = '/';
  
begin
  mainForm.Width := 350;
  mainForm.Height := 120;
  mainForm.Title := 'Calculator';
  mainForm.IsFixedSize := true;
  
  var first := new IntegerField('First:', 100);
  var second := new IntegerField('Second:', 100);
  var result := new IntegerField('Result:', 100);

  LineBreak();
  
  var actions := new ComboBox();
  actions.Items.Add(Sum);
  actions.Items.Add(Difference);
  actions.Items.Add(Multiplication);
  actions.Items.Add(Division);
  actions.SelectedIndex := 0;
  
  var calculate := new Button('Calculate');
  calculate.Click += () ->
    try
      case actions.SelectedValue.ToString()[1] of
        Sum: result.Value := first.Value + second.Value;
        Difference: result.Value := first.Value - second.Value;
        Multiplication: result.Value := first.Value * second.Value;
        Division:
          if second.Value <> 0 then
            result.Value := first.Value div second.Value;
      end;
    except on Exception do
    end;
end.
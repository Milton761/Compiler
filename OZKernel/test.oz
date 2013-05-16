local X in
   X = 1
   local X in
      X=proc {$ X Y Z}
          local T in
            {Value.'<' X Y T}
            if T then Z=true else Z=false end
            case T of '#'(root:X left:nil) then skip else skip end
          end
        end 
      {X A}
   end
   {Browse X}
end

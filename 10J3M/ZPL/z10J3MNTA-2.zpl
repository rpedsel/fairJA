set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3514, <2> 29.0872, <3> 30.4691, <4> 22.0277, <5> 19.6479, <6> 15.8269, <7> 31.8205, <8> 27.0353, <9> 28.8457, <10> 28.1681;
param workload[JOB] := <1> 642.6935, <2> 846.0652, <3> 928.3661, <4> 485.2196, <5> 386.04, <6> 250.4908, <7> 1012.5442, <8> 730.9074, <9> 832.0744, <10> 793.4419;
param capacity[MACHINE] := <1> 1726.9608, <2> 1726.9608, <3> 1726.9608;

var x[JM] binary;
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;

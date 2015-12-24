set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7517, <2> 23.6835, <3> 36.175, <4> 26.3714, <5> 20.7401, <6> 31.2366, <7> 26.381, <8> 25.5618, <9> 23.534, <10> 17.7145;
param workload[JOB] := <1> 5.0746, <2> 4.8666, <3> 6.0146, <4> 5.1353, <5> 4.5541, <6> 5.589, <7> 5.1362, <8> 5.0559, <9> 4.8512, <10> 4.2089;
param capacity[MACHINE] := <1> 50.4864, <2> 50.4864, <3> 50.4864;

var x[JM];
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

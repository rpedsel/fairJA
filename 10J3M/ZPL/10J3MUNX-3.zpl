set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8161, <2> 30.2215, <3> 29.1156, <4> 1.78, <5> 19.5144, <6> 19.3126, <7> 48.038, <8> 35.2243, <9> 9.3595, <10> 30.718;
param workload[JOB] := <1> 4.4515, <2> 5.4974, <3> 5.3959, <4> 1.3342, <5> 4.4175, <6> 4.3946, <7> 6.9309, <8> 5.935, <9> 3.0593, <10> 5.5424;
param capacity[MACHINE] := <1> 46.9587, <2> 46.9587, <3> 46.9587;

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

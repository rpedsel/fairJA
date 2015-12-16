set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1179, <2> 30.4908, <3> 26.9069, <4> 25.0353, <5> 16.9452, <6> 27.4655, <7> 27.0691, <8> 19.1145, <9> 16.781, <10> 25.9568;
param workload[JOB] := <1> 790.6163, <2> 929.6889, <3> 723.9813, <4> 626.7662, <5> 287.1398, <6> 754.3537, <7> 732.7362, <8> 365.3641, <9> 281.602, <10> 673.7555;
param capacity[MACHINE] := <1> 1541.501, <2> 1541.501, <3> 1541.501;

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

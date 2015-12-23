set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.143, <2> 6.7499, <3> 16.2412, <4> 16.6215, <5> 6.8887, <6> 22.0409, <7> 26.7014, <8> 18.9028, <9> 21.7217, <10> 42.6003, <11> 26.5663, <12> 36.1355, <13> 14.2962, <14> 15.4866, <15> 30.6945, <16> 6.1642, <17> 33.9705, <18> 46.217, <19> 34.1959, <20> 36.6418;
param workload[JOB] := <1> 14.143, <2> 6.7499, <3> 16.2412, <4> 16.6215, <5> 6.8887, <6> 22.0409, <7> 26.7014, <8> 18.9028, <9> 21.7217, <10> 42.6003, <11> 26.5663, <12> 36.1355, <13> 14.2962, <14> 15.4866, <15> 30.6945, <16> 6.1642, <17> 33.9705, <18> 46.217, <19> 34.1959, <20> 36.6418;
param capacity[MACHINE] := <1> 472.9799, <2> 472.9799, <3> 472.9799, <4> 472.9799, <5> 472.9799, <6> 472.9799, <7> 472.9799;

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
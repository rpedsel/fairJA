set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.6789, <2> 14.3587, <3> 31.8149, <4> 20.3916, <5> 11.7468, <6> 44.4229, <7> 24.6654, <8> 19.0984, <9> 21.3024, <10> 10.8241, <11> 33.9175, <12> 5.174, <13> 10.7832, <14> 18.7334, <15> 27.7259, <16> 16.2224, <17> 32.5605, <18> 14.1677, <19> 8.7618, <20> 48.6565;
param workload[JOB] := <1> 48.6789, <2> 14.3587, <3> 31.8149, <4> 20.3916, <5> 11.7468, <6> 44.4229, <7> 24.6654, <8> 19.0984, <9> 21.3024, <10> 10.8241, <11> 33.9175, <12> 5.174, <13> 10.7832, <14> 18.7334, <15> 27.7259, <16> 16.2224, <17> 32.5605, <18> 14.1677, <19> 8.7618, <20> 48.6565;
param capacity[MACHINE] := <1> 49.715, <2> 49.715, <3> 49.715, <4> 49.715, <5> 49.715, <6> 49.715, <7> 49.715;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8209, <2> 18.9401, <3> 31.6309, <4> 15.5595, <5> 20.3516, <6> 24.4496, <7> 16.5703, <8> 26.8262, <9> 36.1409, <10> 21.9614, <11> 17.7304, <12> 29.9243, <13> 25.8947, <14> 29.8509, <15> 22.1582, <16> 22.1476, <17> 22.4047, <18> 16.7967, <19> 24.1342, <20> 18.9468;
param workload[JOB] := <1> 14.8209, <2> 18.9401, <3> 31.6309, <4> 15.5595, <5> 20.3516, <6> 24.4496, <7> 16.5703, <8> 26.8262, <9> 36.1409, <10> 21.9614, <11> 17.7304, <12> 29.9243, <13> 25.8947, <14> 29.8509, <15> 22.1582, <16> 22.1476, <17> 22.4047, <18> 16.7967, <19> 24.1342, <20> 18.9468;
param capacity[MACHINE] := <1> 76.2067, <2> 76.2067, <3> 76.2067, <4> 76.2067, <5> 76.2067, <6> 76.2067;

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

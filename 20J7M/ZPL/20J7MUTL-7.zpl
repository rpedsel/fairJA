set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0946, <2> 20.3854, <3> 23.6995, <4> 20.3402, <5> 18.9958, <6> 38.8746, <7> 10.2143, <8> 25.1107, <9> 8.2, <10> 45.9402, <11> 26.4996, <12> 4.9394, <13> 31.4048, <14> 35.1114, <15> 41.4536, <16> 24.5519, <17> 24.154, <18> 20.7405, <19> 14.7304, <20> 3.6576;
param workload[JOB] := <1> 29.0946, <2> 20.3854, <3> 23.6995, <4> 20.3402, <5> 18.9958, <6> 38.8746, <7> 10.2143, <8> 25.1107, <9> 8.2, <10> 45.9402, <11> 26.4996, <12> 4.9394, <13> 31.4048, <14> 35.1114, <15> 41.4536, <16> 24.5519, <17> 24.154, <18> 20.7405, <19> 14.7304, <20> 3.6576;
param capacity[MACHINE] := <1> 50.1534, <2> 50.1534, <3> 50.1534, <4> 50.1534, <5> 50.1534, <6> 50.1534, <7> 50.1534;

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

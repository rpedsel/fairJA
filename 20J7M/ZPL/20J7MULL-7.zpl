set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4517, <2> 25.2003, <3> 20.3044, <4> 18.4569, <5> 32.45, <6> 35.6891, <7> 44.9867, <8> 12.7767, <9> 36.5143, <10> 0.8748, <11> 44.5935, <12> 13.5277, <13> 6.4915, <14> 29.6982, <15> 18.2396, <16> 27.2802, <17> 18.4918, <18> 0.1947, <19> 47.593, <20> 48.3324;
param workload[JOB] := <1> 23.4517, <2> 25.2003, <3> 20.3044, <4> 18.4569, <5> 32.45, <6> 35.6891, <7> 44.9867, <8> 12.7767, <9> 36.5143, <10> 0.8748, <11> 44.5935, <12> 13.5277, <13> 6.4915, <14> 29.6982, <15> 18.2396, <16> 27.2802, <17> 18.4918, <18> 0.1947, <19> 47.593, <20> 48.3324;
param capacity[MACHINE] := <1> 72.1639, <2> 72.1639, <3> 72.1639, <4> 72.1639, <5> 72.1639, <6> 72.1639, <7> 72.1639;

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

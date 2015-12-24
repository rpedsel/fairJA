set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.0821, <2> 14.1759, <3> 14.2962, <4> 13.7935, <5> 25.8048, <6> 40.002, <7> 12.4995, <8> 16.8221, <9> 29.4953, <10> 36.3035, <11> 44.2817, <12> 8.202, <13> 45.1396, <14> 27.1476, <15> 4.113, <16> 2.3085, <17> 12.8111, <18> 48.2241, <19> 48.4828, <20> 16.861;
param workload[JOB] := <1> 26.5036, <2> 9.9374, <3> 47.5364, <4> 47.8966, <5> 5.4984, <6> 7.8059, <7> 49.6311, <8> 34.7769, <9> 16.4865, <10> 15.0699, <11> 40.9056, <12> 43.1787, <13> 41.6054, <14> 6.6178, <15> 7.7228, <16> 17.2679, <17> 47.1374, <18> 2.5546, <19> 19.6029, <20> 19.5134;
param capacity[MACHINE] := <1> 72.4642, <2> 72.4642, <3> 72.4642, <4> 72.4642, <5> 72.4642, <6> 72.4642, <7> 72.4642;

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

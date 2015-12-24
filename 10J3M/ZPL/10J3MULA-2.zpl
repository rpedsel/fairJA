set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.0567, <2> 13.4761, <3> 30.6624, <4> 12.4808, <5> 18.5511, <6> 33.5578, <7> 21.058, <8> 27.6817, <9> 18.912, <10> 28.5394;
param workload[JOB] := <1> 257.8176, <2> 181.6053, <3> 940.1828, <4> 155.7704, <5> 344.1433, <6> 1126.1259, <7> 443.4394, <8> 766.2765, <9> 357.6637, <10> 814.4974;
param capacity[MACHINE] := <1> 1795.8408, <2> 1795.8408, <3> 1795.8408;

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

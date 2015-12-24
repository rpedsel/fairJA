set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.6533, <2> 24.7269, <3> 31.0143, <4> 26.3863, <5> 26.8452, <6> 25.4782, <7> 23.022, <8> 26.117, <9> 19.4495, <10> 28.1927;
param workload[JOB] := <1> 4.7595, <2> 4.9726, <3> 5.569, <4> 5.1368, <5> 5.1812, <6> 5.0476, <7> 4.7981, <8> 5.1105, <9> 4.4102, <10> 5.3097;
param capacity[MACHINE] := <1> 12.5738, <2> 12.5738, <3> 12.5738;

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

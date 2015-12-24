set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.5771, <2> 6.9843, <3> 1.3307, <4> 3.1195, <5> 0.6365, <6> 9.1224, <7> 45.0827, <8> 28.2784, <9> 39.1707, <10> 29.3644, <11> 8.5677, <12> 48.2343, <13> 13.5384, <14> 4.3763, <15> 5.63, <16> 38.9084, <17> 4.4648, <18> 25.6729, <19> 36.1718, <20> 4.799;
param workload[JOB] := <1> 6.8247, <2> 2.6428, <3> 1.1536, <4> 1.7662, <5> 0.7978, <6> 3.0203, <7> 6.7144, <8> 5.3177, <9> 6.2587, <10> 5.4189, <11> 2.9271, <12> 6.9451, <13> 3.6795, <14> 2.092, <15> 2.3728, <16> 6.2377, <17> 2.113, <18> 5.0668, <19> 6.0143, <20> 2.1907;
param capacity[MACHINE] := <1> 8.5237, <2> 8.5237, <3> 8.5237, <4> 8.5237, <5> 8.5237, <6> 8.5237, <7> 8.5237;

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

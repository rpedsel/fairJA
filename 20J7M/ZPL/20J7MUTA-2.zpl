set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.1645, <2> 7.3256, <3> 29.7808, <4> 13.522, <5> 27.2506, <6> 19.1865, <7> 20.6742, <8> 12.5601, <9> 16.3265, <10> 6.5264, <11> 34.9915, <12> 39.7626, <13> 1.38, <14> 18.0743, <15> 37.3641, <16> 38.9702, <17> 31.0939, <18> 39.8456, <19> 41.5058, <20> 9.5979;
param workload[JOB] := <1> 1613.1871, <2> 53.6644, <3> 886.896, <4> 182.8445, <5> 742.5952, <6> 368.1218, <7> 427.4225, <8> 157.7561, <9> 266.5546, <10> 42.5939, <11> 1224.4051, <12> 1581.0644, <13> 1.9044, <14> 326.6803, <15> 1396.076, <16> 1518.6765, <17> 966.8306, <18> 1587.6718, <19> 1722.7314, <20> 92.1197;
param capacity[MACHINE] := <1> 1624.2639, <2> 1624.2639, <3> 1624.2639, <4> 1624.2639, <5> 1624.2639, <6> 1624.2639, <7> 1624.2639;

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

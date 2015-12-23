set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2848, <2> 25.2329, <3> 32.3127, <4> 25.1823, <5> 30.3328, <6> 29.5107, <7> 30.1285, <8> 34.6562, <9> 25.6922, <10> 24.4585, <11> 23.768, <12> 25.0805, <13> 20.79, <14> 31.3102, <15> 31.0813, <16> 20.624, <17> 27.6521, <18> 25.4432, <19> 23.8704, <20> 30.2141;
param workload[JOB] := <1> 4.7207, <2> 5.0232, <3> 5.6844, <4> 5.0182, <5> 5.5075, <6> 5.4324, <7> 5.4889, <8> 5.887, <9> 5.0687, <10> 4.9456, <11> 4.8752, <12> 5.008, <13> 4.5596, <14> 5.5956, <15> 5.5751, <16> 4.5414, <17> 5.2585, <18> 5.0441, <19> 4.8857, <20> 5.4967;
param capacity[MACHINE] := <1> 103.6165, <2> 103.6165, <3> 103.6165, <4> 103.6165, <5> 103.6165, <6> 103.6165, <7> 103.6165;

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

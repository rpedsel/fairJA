set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.1926, <2> 44.524, <3> 12.9685, <4> 2.0182, <5> 42.5584, <6> 9.4719, <7> 39.6399, <8> 47.8223, <9> 14.0228, <10> 22.0402, <11> 41.8494, <12> 8.245, <13> 12.9108, <14> 44.1169, <15> 28.4015, <16> 19.6234, <17> 13.7928, <18> 22.1787, <19> 17.4845, <20> 42.9877;
param workload[JOB] := <1> 7.1926, <2> 44.524, <3> 12.9685, <4> 2.0182, <5> 42.5584, <6> 9.4719, <7> 39.6399, <8> 47.8223, <9> 14.0228, <10> 22.0402, <11> 41.8494, <12> 8.245, <13> 12.9108, <14> 44.1169, <15> 28.4015, <16> 19.6234, <17> 13.7928, <18> 22.1787, <19> 17.4845, <20> 42.9877;
param capacity[MACHINE] := <1> 70.5499, <2> 70.5499, <3> 70.5499, <4> 70.5499, <5> 70.5499, <6> 70.5499, <7> 70.5499;

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

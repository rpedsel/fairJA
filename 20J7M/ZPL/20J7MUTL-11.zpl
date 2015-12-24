set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.6278, <2> 0.7903, <3> 21.9396, <4> 39.5198, <5> 39.2223, <6> 19.3043, <7> 28.6901, <8> 7.0878, <9> 48.8606, <10> 41.9589, <11> 22.0956, <12> 4.275, <13> 3.7837, <14> 46.6391, <15> 12.8905, <16> 34.4749, <17> 28.533, <18> 32.756, <19> 40.8106, <20> 14.0535;
param workload[JOB] := <1> 32.6278, <2> 0.7903, <3> 21.9396, <4> 39.5198, <5> 39.2223, <6> 19.3043, <7> 28.6901, <8> 7.0878, <9> 48.8606, <10> 41.9589, <11> 22.0956, <12> 4.275, <13> 3.7837, <14> 46.6391, <15> 12.8905, <16> 34.4749, <17> 28.533, <18> 32.756, <19> 40.8106, <20> 14.0535;
param capacity[MACHINE] := <1> 55.7479, <2> 55.7479, <3> 55.7479, <4> 55.7479, <5> 55.7479, <6> 55.7479, <7> 55.7479;

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

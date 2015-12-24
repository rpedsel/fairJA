set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.5508, <2> 18.0564, <3> 25.8753, <4> 21.9136, <5> 9.2925, <6> 7.0916, <7> 41.7598, <8> 4.7292, <9> 29.7662, <10> 4.1725, <11> 43.7519, <12> 29.3036, <13> 9.2072, <14> 42.1053, <15> 7.9074, <16> 47.3669, <17> 13.6662, <18> 48.8548, <19> 22.2209, <20> 48.6971;
param workload[JOB] := <1> 17.9786, <2> 22.5723, <3> 17.7069, <4> 7.8419, <5> 45.3668, <6> 37.5411, <7> 6.7756, <8> 19.5767, <9> 29.0831, <10> 37.3445, <11> 2.8676, <12> 1.9798, <13> 4.1099, <14> 11.8531, <15> 6.6016, <16> 49.7928, <17> 45.1921, <18> 4.5847, <19> 22.3173, <20> 20.4613;
param capacity[MACHINE] := <1> 50.6649, <2> 50.6649, <3> 50.6649, <4> 50.6649, <5> 50.6649, <6> 50.6649, <7> 50.6649;

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

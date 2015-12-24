set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.1709, <2> 36.2174, <3> 48.9553, <4> 1.0034, <5> 48.9285, <6> 16.9535, <7> 48.8601, <8> 30.3374, <9> 10.3235, <10> 39.6489, <11> 15.6928, <12> 29.7003, <13> 48.4996, <14> 30.6845, <15> 15.2625, <16> 11.127, <17> 31.4051, <18> 33.752, <19> 6.9741, <20> 44.1402;
param workload[JOB] := <1> 34.8021, <2> 8.0125, <3> 22.7881, <4> 13.7602, <5> 46.2661, <6> 47.7421, <7> 42.6441, <8> 43.2434, <9> 17.6952, <10> 2.3083, <11> 41.8954, <12> 25.6758, <13> 10.48, <14> 28.2898, <15> 27.3267, <16> 2.9887, <17> 29.76, <18> 47.2006, <19> 21.8388, <20> 28.3091;
param capacity[MACHINE] := <1> 77.5753, <2> 77.5753, <3> 77.5753, <4> 77.5753, <5> 77.5753, <6> 77.5753, <7> 77.5753;

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

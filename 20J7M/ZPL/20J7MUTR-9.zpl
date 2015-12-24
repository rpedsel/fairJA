set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.3855, <2> 4.502, <3> 9.3052, <4> 29.043, <5> 4.1667, <6> 3.3505, <7> 48.121, <8> 3.0949, <9> 30.3029, <10> 36.9214, <11> 17.0643, <12> 3.7424, <13> 44.3771, <14> 43.5381, <15> 26.7808, <16> 32.5089, <17> 22.5064, <18> 7.8918, <19> 5.1979, <20> 33.4358;
param workload[JOB] := <1> 1.9054, <2> 5.6404, <3> 39.8061, <4> 4.4218, <5> 42.0563, <6> 22.3585, <7> 44.3039, <8> 6.3074, <9> 20.1605, <10> 33.2397, <11> 44.3149, <12> 38.3369, <13> 20.1297, <14> 26.8807, <15> 48.695, <16> 25.757, <17> 19.2021, <18> 38.3571, <19> 18.3142, <20> 37.4677;
param capacity[MACHINE] := <1> 57.6059, <2> 57.6059, <3> 57.6059, <4> 57.6059, <5> 57.6059, <6> 57.6059, <7> 57.6059;

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

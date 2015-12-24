set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.8562, <2> 48.3463, <3> 43.9661, <4> 49.8037, <5> 39.5681, <6> 16.1855, <7> 40.0042, <8> 17.4574, <9> 18.6544, <10> 36.3225, <11> 21.5457, <12> 16.8384, <13> 10.5576, <14> 6.8819, <15> 25.6644, <16> 21.7682, <17> 46.5798, <18> 3.7675, <19> 19.6987, <20> 32.7649;
param workload[JOB] := <1> 3.2949, <2> 6.9532, <3> 6.6307, <4> 7.0572, <5> 6.2903, <6> 4.0231, <7> 6.3249, <8> 4.1782, <9> 4.3191, <10> 6.0268, <11> 4.6417, <12> 4.1035, <13> 3.2492, <14> 2.6233, <15> 5.066, <16> 4.6656, <17> 6.8249, <18> 1.941, <19> 4.4383, <20> 5.7241;
param capacity[MACHINE] := <1> 98.376, <2> 98.376, <3> 98.376, <4> 98.376, <5> 98.376, <6> 98.376, <7> 98.376;

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

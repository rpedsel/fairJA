set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5784, <2> 26.7853, <3> 20.8568, <4> 26.539, <5> 36.9439, <6> 28.5606, <7> 24.728, <8> 27.0045, <9> 16.1572, <10> 20.854, <11> 26.7143, <12> 24.6576, <13> 30.1969, <14> 28.7741, <15> 27.7548, <16> 18.7224, <17> 22.3557, <18> 18.9601, <19> 24.8834, <20> 30.1426;
param workload[JOB] := <1> 24.5784, <2> 26.7853, <3> 20.8568, <4> 26.539, <5> 36.9439, <6> 28.5606, <7> 24.728, <8> 27.0045, <9> 16.1572, <10> 20.854, <11> 26.7143, <12> 24.6576, <13> 30.1969, <14> 28.7741, <15> 27.7548, <16> 18.7224, <17> 22.3557, <18> 18.9601, <19> 24.8834, <20> 30.1426;
param capacity[MACHINE] := <1> 506.1696, <2> 506.1696, <3> 506.1696, <4> 506.1696, <5> 506.1696, <6> 506.1696;

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

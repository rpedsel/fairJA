set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3793, <2> 24.691, <3> 24.2741, <4> 30.1625, <5> 27.6431, <6> 20.8771, <7> 18.8962, <8> 17.4095, <9> 20.7668, <10> 19.2522, <11> 20.8339, <12> 14.4147, <13> 31.7049, <14> 27.5236, <15> 31.1874, <16> 35.3465, <17> 20.0459, <18> 25.1579, <19> 25.2674, <20> 28.2669;
param workload[JOB] := <1> 5.5117, <2> 4.969, <3> 4.9269, <4> 5.492, <5> 5.2577, <6> 4.5691, <7> 4.347, <8> 4.1725, <9> 4.5571, <10> 4.3877, <11> 4.5644, <12> 3.7967, <13> 5.6307, <14> 5.2463, <15> 5.5846, <16> 5.9453, <17> 4.4773, <18> 5.0158, <19> 5.0267, <20> 5.3167;
param capacity[MACHINE] := <1> 16.4659, <2> 16.4659, <3> 16.4659, <4> 16.4659, <5> 16.4659, <6> 16.4659;

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

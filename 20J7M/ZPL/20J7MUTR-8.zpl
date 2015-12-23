set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.8041, <2> 0.3293, <3> 42.7289, <4> 14.5484, <5> 29.6303, <6> 26.9987, <7> 29.9749, <8> 12.0297, <9> 14.178, <10> 46.886, <11> 48.8349, <12> 29.6977, <13> 27.5735, <14> 13.0258, <15> 32.8976, <16> 35.8726, <17> 38.7681, <18> 4.0739, <19> 36.6925, <20> 14.0391;
param workload[JOB] := <1> 16.1195, <2> 17.8582, <3> 12.8985, <4> 29.0945, <5> 10.6595, <6> 47.0925, <7> 20.4319, <8> 39.7598, <9> 7.3574, <10> 14.347, <11> 3.6753, <12> 28.8204, <13> 6.0682, <14> 34.6143, <15> 31.7463, <16> 35.6438, <17> 35.1885, <18> 4.0338, <19> 5.7712, <20> 13.6958;
param capacity[MACHINE] := <1> 44.4511, <2> 44.4511, <3> 44.4511, <4> 44.4511, <5> 44.4511, <6> 44.4511, <7> 44.4511;

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

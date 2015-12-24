set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7648, <2> 20.8071, <3> 20.6569, <4> 18.5496, <5> 15.9709, <6> 25.8707, <7> 25.1437, <8> 33.697, <9> 17.5441, <10> 31.7475, <11> 33.3698, <12> 30.3021, <13> 20.3697, <14> 28.3353, <15> 32.0709, <16> 25.9241, <17> 26.1417, <18> 25.9832, <19> 27.1639, <20> 24.7336;
param workload[JOB] := <1> 5.7241, <2> 4.5615, <3> 4.545, <4> 4.3069, <5> 3.9964, <6> 5.0863, <7> 5.0143, <8> 5.8049, <9> 4.1886, <10> 5.6345, <11> 5.7767, <12> 5.5047, <13> 4.5133, <14> 5.3231, <15> 5.6631, <16> 5.0916, <17> 5.1129, <18> 5.0974, <19> 5.2119, <20> 4.9733;
param capacity[MACHINE] := <1> 101.1305, <2> 101.1305, <3> 101.1305, <4> 101.1305, <5> 101.1305, <6> 101.1305, <7> 101.1305;

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

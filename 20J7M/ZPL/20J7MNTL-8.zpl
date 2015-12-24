set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0532, <2> 31.1751, <3> 30.9305, <4> 25.6088, <5> 38.2098, <6> 18.0604, <7> 26.9888, <8> 31.0081, <9> 30.9457, <10> 25.6207, <11> 32.7041, <12> 27.7569, <13> 17.4027, <14> 21.721, <15> 31.5972, <16> 26.3738, <17> 30.8062, <18> 19.4293, <19> 22.9459, <20> 18.1683;
param workload[JOB] := <1> 23.0532, <2> 31.1751, <3> 30.9305, <4> 25.6088, <5> 38.2098, <6> 18.0604, <7> 26.9888, <8> 31.0081, <9> 30.9457, <10> 25.6207, <11> 32.7041, <12> 27.7569, <13> 17.4027, <14> 21.721, <15> 31.5972, <16> 26.3738, <17> 30.8062, <18> 19.4293, <19> 22.9459, <20> 18.1683;
param capacity[MACHINE] := <1> 56.84, <2> 56.84, <3> 56.84, <4> 56.84, <5> 56.84, <6> 56.84, <7> 56.84;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.264, <2> 9.2146, <3> 31.9203, <4> 35.5692, <5> 5.4079, <6> 12.7178, <7> 47.609, <8> 11.336, <9> 33.4537, <10> 44.454, <11> 43.2203, <12> 6.9065, <13> 34.9027, <14> 21.8687, <15> 37.2562, <16> 9.5313, <17> 47.1277, <18> 8.9463, <19> 8.5479, <20> 48.1993;
param workload[JOB] := <1> 8.8062, <2> 14.0755, <3> 20.7928, <4> 29.5411, <5> 37.0318, <6> 19.8183, <7> 28.7434, <8> 4.0871, <9> 9.444, <10> 29.1381, <11> 7.5347, <12> 20.4864, <13> 48.8172, <14> 25.5449, <15> 48.8666, <16> 14.6536, <17> 26.1813, <18> 16.0516, <19> 1.1416, <20> 5.025;
param capacity[MACHINE] := <1> 58.9517, <2> 58.9517, <3> 58.9517, <4> 58.9517, <5> 58.9517, <6> 58.9517, <7> 58.9517;

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

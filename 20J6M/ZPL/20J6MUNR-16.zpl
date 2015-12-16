set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.2128, <2> 36.3132, <3> 46.7588, <4> 13.2039, <5> 1.5139, <6> 3.598, <7> 41.0976, <8> 43.2909, <9> 25.7768, <10> 28.9792, <11> 25.5921, <12> 15.2973, <13> 8.5525, <14> 43.5312, <15> 6.9085, <16> 39.5245, <17> 29.7957, <18> 11.0962, <19> 46.6982, <20> 31.5808;
param workload[JOB] := <1> 12.7207, <2> 1.4127, <3> 6.6953, <4> 22.8704, <5> 14.481, <6> 36.9103, <7> 7.986, <8> 2.1399, <9> 44.7689, <10> 24.3725, <11> 30.9496, <12> 42.9604, <13> 43.5308, <14> 17.0742, <15> 26.0855, <16> 20.7603, <17> 25.9618, <18> 30.1853, <19> 20.2427, <20> 21.7074;
param capacity[MACHINE] := <1> 453.8157, <2> 453.8157, <3> 453.8157, <4> 453.8157, <5> 453.8157, <6> 453.8157;

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
